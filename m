Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02BBC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 22 May 2022 15:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346899AbiEVPTY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 22 May 2022 11:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiEVPTX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 22 May 2022 11:19:23 -0400
X-Greylist: delayed 141 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 22 May 2022 08:19:18 PDT
Received: from jari.cn (unknown [218.92.28.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2BEF813F09
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 May 2022 08:19:17 -0700 (PDT)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Sun, 22 May
 2022 23:11:34 +0800 (GMT+08:00)
X-Originating-IP: [182.148.12.156]
Date:   Sun, 22 May 2022 23:11:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?6ZmI5a2m5YW1?= <chenxuebing@jari.cn>
To:     krzk@kernel.org
Cc:     alim.akhtar@samsung.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ARM: s3c: Use strscpy to replace strlcpy
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1f4faebf.9e6.180ec52dc40.Coremail.chenxuebing@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwBHUW+nUopiSQA3AA--.652W
X-CM-SenderInfo: hfkh05pxhex0nj6mt2flof0/1tbiAQAOCmFEYxsksAAAsM
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
