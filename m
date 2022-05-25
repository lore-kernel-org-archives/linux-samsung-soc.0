Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281CCC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 May 2022 02:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239046AbiEYCiW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 May 2022 22:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbiEYCiT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 May 2022 22:38:19 -0400
Received: from jari.cn (unknown [218.92.28.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 66B2D6F4AF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 May 2022 19:38:14 -0700 (PDT)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Wed, 25 May
 2022 10:32:46 +0800 (GMT+08:00)
X-Originating-IP: [182.148.13.40]
Date:   Wed, 25 May 2022 10:32:46 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   "XueBing Chen" <chenxuebing@jari.cn>
To:     krzk@kernel.org
Cc:     alim.akhtar@samsung.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] ARM: s3c: Use strscpy to replace strlcpy
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3e0217ca.a1d.180f90f39c7.Coremail.chenxuebing@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwAXIW9OlY1iEuU3AA--.626W
X-CM-SenderInfo: hfkh05pxhex0nj6mt2flof0/1tbiAQAOCmFEYxsksAAIsE
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

ClRoZSBzdHJsY3B5IHNob3VsZCBub3QgYmUgdXNlZCBiZWNhdXNlIGl0IGRvZXNuJ3QgbGltaXQg
dGhlIHNvdXJjZQpsZW5ndGguICBQcmVmZXJyZWQgaXMgc3Ryc2NweS4KClNpZ25lZC1vZmYtYnk6
IFh1ZUJpbmcgQ2hlbiA8Y2hlbnh1ZWJpbmdAamFyaS5jbj4KLS0tCiBhcmNoL2FybS9tYWNoLXMz
Yy9tYWNoLW1pbmkyNDQwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXMzYy9tYWNoLW1pbmky
NDQwLmMgYi9hcmNoL2FybS9tYWNoLXMzYy9tYWNoLW1pbmkyNDQwLmMKaW5kZXggNTUxZWM2NjBh
YjU5Li45OGNlYmMwNjUyMWMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21hY2gtczNjL21hY2gtbWlu
aTI0NDAuYworKysgYi9hcmNoL2FybS9tYWNoLXMzYy9tYWNoLW1pbmkyNDQwLmMKQEAgLTYyNCw3
ICs2MjQsNyBAQCBzdGF0aWMgY2hhciBtaW5pMjQ0MF9mZWF0dXJlc19zdHJbMTJdIF9faW5pdGRh
dGEgPSAiMHRiIjsKIHN0YXRpYyBpbnQgX19pbml0IG1pbmkyNDQwX2ZlYXR1cmVzX3NldHVwKGNo
YXIgKnN0cikKIHsKIAlpZiAoc3RyKQotCQlzdHJsY3B5KG1pbmkyNDQwX2ZlYXR1cmVzX3N0ciwg
c3RyLAorCQlzdHJzY3B5KG1pbmkyNDQwX2ZlYXR1cmVzX3N0ciwgc3RyLAogCQkJc2l6ZW9mKG1p
bmkyNDQwX2ZlYXR1cmVzX3N0cikpOwogCXJldHVybiAxOwogfQotLSAKMi4zNi4xCg==
