$(function() {
    var click_count = 0;    // �{�^���J�E���g�p�ϐ�

    if (typeof Blob !== "undefined") {
        // alert('���̃u���E�U�ɑΉ����Ă��܂�');
    } else {
        alert('���̃u���E�U�ɂ͑Ή����Ă��܂���');
    }

    $("#count").click(function(){
        click_count++; // �{�^���������������J�E���g
        // text_box�N���X�̃e�L�X�g�̒l��ύX
        $("#contents_sample_wrap .text_box").text("�{�^����" + click_count + "��N���b�N����܂���");
    });

    $("#export").click(function(){  // �o�̓{�^�����������ꍇ�́AsetBlobUrl�֐��ɒl��n���Ď��s
        setBlobUrl("download", click_count);
    });
});


function setBlobUrl(id, content) {

 // �w�肳�ꂽ�f�[�^��ێ�����Blob���쐬����B
    var blob = new Blob([ content ], { "type" : "application/x-msdownload" });
 
 // A�^�O��href������Blob�I�u�W�F�N�g��ݒ肵�A�����N�𐶐�
    window.URL = window.URL || window.webkitURL;
    $("#" + id).attr("href", window.URL.createObjectURL(blob));
    $("#" + id).attr("download", "tmp.txt");
}