const moveAnimeArray = [
    '.mz-anime-files .mz-anime-file:first-child',
    '.mz-anime-folders > span:last-of-type',
    '.mz-anime-folders span:first-child'
];

const fadeAnimeArray = [
    '.mz-anime-files-fade',
    '',
    '.mz-anime-folders-fade'
];

document.addEventListener("DOMContentLoaded", function() {
    animationTransition();
    startTransition();
    
    var i18n = window.domI18n({
        selector: '[data-translatable]',
        languages: ['en', 'zh-TW'],
        defaultLanguage: 'en'
    });
    var userLang = navigator.language || navigator.userLanguage;
    i18n.changeLanguage(userLang == 'zh-TW' || userLang == 'zh-CN' ? 'zh-TW' : 'en');
});

async function startTransition() {
    selectFilesTransition();
    await sleep(3000);

    let zip = document.querySelector('.mz-anime-zip img');
    zip.style.left = zip.offsetLeft + 'px';
    zip.style.top = zip.offsetTop + 'px';

    let style = document.createElement('style');
    style.type = 'text/css';
    style.id = 'moveClass';
    document.getElementsByTagName('head')[0].appendChild(style);

    zip.classList.add('moveClass');
    nextMoveTransition('.mz-anime-files span.mz-anime-file:last-of-type');
}

async function selectFilesTransition() {
    const fileList = document.querySelectorAll('.mz-anime-files .mz-anime-file');
    for (const [i, el] of fileList.entries()) {
        if (i === 0 || i === 3) {
            await sleep(1000);
            el.classList.add('mz-file-selected');
        }
    } 
}

async function nextMoveTransition(selectorId) {
    await sleep(500);
    let style = document.getElementById('moveClass');
    let moveTarget = document.querySelector('.moveClass');
    let target = document.querySelector(selectorId);
    let offsetHeight = (moveTarget.offsetHeight - target.offsetHeight) / 2;
    style.innerHTML = '.moveClass { left: ' + target.offsetLeft + 'px !important; top: ' + (target.offsetParent.offsetTop - offsetHeight) + 'px !important; }';
}

async function nextFadeTransition(selectorId) {
    await sleep(500);
    document.querySelector(selectorId).classList.add('mz-fading');
}

function animationTransition() {
    let zip = document.querySelector('.mz-anime-zip img');
    let moveIndex = 0;
    let moveCount = 0;
    zip.addEventListener('transitionend', e => {
        if (moveIndex < moveAnimeArray.length && moveCount % 2 == 0) {
            nextMoveTransition(moveAnimeArray[moveIndex]);
            if (fadeAnimeArray[moveIndex] !== '') {
                nextFadeTransition(fadeAnimeArray[moveIndex])
            }
            moveIndex++;
        } else if (moveIndex == moveAnimeArray.length && moveCount % 2 == 1) {
            showResult();
        }
        moveCount++;
        
    });
}

async function showResult() {
    await sleep(1000);
    let resultDom = document.querySelector('.mz-anime-result');
    resultDom.classList.add('show');
    let zip = document.querySelector('.mz-anime-zip img');
    resultDom.style.top = zip.offsetTop + 20 + 'px';
    await sleep(100);
    resultDom.classList.add('fade-in');
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}