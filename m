Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE14CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E47C60E8F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhJaRBT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 13:01:19 -0400
Received: from h02mx15.reliablemail.org ([185.76.66.168]:23906 "EHLO
        h02mx15.reliablemail.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbhJaRBT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 13:01:19 -0400
X-Halon-Out: cf351678-3a6b-11ec-930f-f5be715b97e5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grimler.se;
        s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=nOl5nlIxqfkxGqt8uVGk5GyJ6n7o+DeMWTuUJU2cxx8=; b=Y7gJJLM8eXhdiLtVOh1W0NCIJ0
        TLFj2fDQKTjJyLPYYXAMUHEz7SLpd2VDXMjuP8A6V5KT8y6T6rJKwQvq18CRCDXruWHnTs9BVk608
        ZOScUKgg5Lk+w4PArOyB0oME02se6CniZrx7K46sKF8MX+Wbvj1a/x3dR56U5SgXVMaDN3ttBlL81
        IQT24y7mp3yoYz3TkRiNCb2S2QJSrhDzps7PnfYS/IjiaSPMelfpxusuuC3+Tds3hnvjIo0QPCV2r
        O3RC7WLKeARsxvtl3aQslzwD8sKCeyW2zBh/mCZFyjpH77IVxY/GnQifiw0sTa4aNJ+M2/UdzpsTv
        bdhYqJWA==;
From:   Henrik Grimler <henrik@grimler.se>
To:     krzysztof.kozlowski@canonical.com, chanho61.park@samsung.com,
        semen.protsenko@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 2/2] soc: samsung: exynos-chipid: be more informative when soc is unknown
Date:   Sun, 31 Oct 2021 17:56:45 +0100
Message-Id: <20211031165645.1182368-2-henrik@grimler.se>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211031165645.1182368-1-henrik@grimler.se>
References: <20211031165645.1182368-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpsrv07.misshosting.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - grimler.se
X-Get-Message-Sender-Via: cpsrv07.misshosting.com: authenticated_id: henrik@grimler.se
X-Authenticated-Sender: cpsrv07.misshosting.com: henrik@grimler.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Print the obtained product id that is incompatible.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 drivers/soc/samsung/exynos-chipid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 7fe44f71920d..885d578fd005 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -132,7 +132,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						"%x", soc_info.revision);
 	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
 	if (!soc_dev_attr->soc_id) {
-		pr_err("Unknown SoC\n");
+		pr_err("Exynos: Unknown SoC: 0x%x\n", soc_info.product_id);
 		return -ENODEV;
 	}
 
-- 
2.33.1

