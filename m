Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA91DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B46A560E8F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhJaRBI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 13:01:08 -0400
Received: from h04mx16.reliablemail.org ([185.76.67.209]:24311 "EHLO
        h04mx16.reliablemail.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbhJaRBH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 13:01:07 -0400
X-Halon-Out: c87c36e0-3a6b-11ec-a232-556aad082471
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grimler.se;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=nETgqTUmnIC9S8IKZ+fJ3c8TD0AfhNbJNlYD3lzNIJM=; b=GzDFG6ELjMdFCER4RAaTCjmIRh
        QRoRMEoUrBKkjE92zHeP+fB8ca1rTdGaulAL8MtrZMIHaugkxt/mjm70aMsOiGEDX4pr4OAeWC1wG
        2XbVDaGQkmEKFzeK7i0wpwXCcXtDRql0LfbJfVmoCVVTN/MtHAmhvCNo3wW6I+fQN3vFYh7K8pfmP
        u45zZZrG0aYaIyKa/CJ3+yrFEvHfXtS/oSWjpTWjMjBirupsykqkxwxzflLo5Kzw7Xvti6jhV0VJq
        EGMBbAHBm/8XPya/zQWFJ1plCzHlflQns1vx4Cysl3J9cS4P2fkf2nm79zRTpfmSQ+sDoCdtJfjHC
        HjjN9ofg==;
From:   Henrik Grimler <henrik@grimler.se>
To:     krzysztof.kozlowski@canonical.com, chanho61.park@samsung.com,
        semen.protsenko@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 1/2] soc: samsung: exynos-chipid: print entire PRO_ID reg when probing
Date:   Sun, 31 Oct 2021 17:56:44 +0100
Message-Id: <20211031165645.1182368-1-henrik@grimler.se>
X-Mailer: git-send-email 2.33.1
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

Older Exynos socs has one reg PRO_ID containing both product id and
revision information. Newer Exynos socs has one Product_ID reg with
product id, and one CHIPID_REV reg with revision information.

In commit c072c4ef7ef0 ("soc: samsung: exynos-chipid: Pass revision
reg offsets") the driver was changed so that the revision part of
PRO_ID is masked to 0 when printed during probing. This can give a
false impression that the revision is 0, so lets change so entire
PRO_ID reg is printed again.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
Has been tested on exynos4412-i9300, which is compatible with
exynos4210-chipid, and on an exynos8895 device compatible with
exynos850-chipid.
---
drivers/soc/samsung/exynos-chipid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index a28053ec7e6a..7fe44f71920d 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -33,6 +33,7 @@ struct exynos_chipid_variant {
 };
 
 struct exynos_chipid_info {
+	u32 pro_id;
 	u32 product_id;
 	u32 revision;
 };
@@ -79,6 +80,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
 	if (ret < 0)
 		return ret;
+	soc_info->pro_id = val;
 	soc_info->product_id = val & EXYNOS_MASK;
 
 	if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
@@ -146,7 +148,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, soc_dev);
 
 	dev_info(&pdev->dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+		 soc_dev_attr->soc_id, soc_info.pro_id, soc_info.revision);
 
 	return 0;
 

base-commit: b417d1e88f32645ed62a00d43c347b4386a0a021
-- 
2.33.1

