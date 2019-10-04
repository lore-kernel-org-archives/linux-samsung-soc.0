Return-Path: <SRS0=VUgU=X5=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1613C47404
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Oct 2019 17:53:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE069222C0
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Oct 2019 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570211586;
	bh=QHsXGo3SXMUdqqqV8OOHHD6k06WkeF17U+7ySvsCjbY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=dllUZQd8KrZcDS4VuGFh2zv7yGxdOPd+Dul6FRcIJ5Pt5ioRc4jb8rMgEg3Omz4xx
	 XtErn/ydJjhhcXE7rCl5q+sTBIQ0I8yOab1EmpV3ClnE//DV5WSN3gvFybSlGWRdCN
	 a92vXCHkNBIPFyMTaSA+YmD7ICK0CRa1U/dCm+44=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388842AbfJDRws (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Oct 2019 13:52:48 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50972 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388651AbfJDRws (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 13:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=PqH+pmNSKzAVLMsLDYh0kPyzUfOiTsqiMOyiGdp8fzc=; b=JKiyudwiEdoK
        S2pAXnBTzBYyw+jDX0e+hIq0ps7AH5aR7bpYsz/71RBT8+pJ2MzwK5cYOKgP8vk04+TcWL+uWKQtc
        0pINQAfUnxfV1+FSYsHCl6Mc0uewBdH/uBUVlUcZ1uIrPxBEO3JmMA9Q3UnXmgaZGsiSe+FN2cSZy
        cuOD8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iGRkr-0003vZ-HS; Fri, 04 Oct 2019 17:52:37 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 0F09C2741EF2; Fri,  4 Oct 2019 18:52:37 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org,
        b.zolnierkie@samsung.com, ckeepax@opensource.cirrus.com,
        krzk@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        m.szyprowski@samsung.com, patches@opensource.cirrus.com,
        sbkim73@samsung.com
Subject: Applied "ASoC: samsung: arndale: Simplify DAI link initialization" to the asoc tree
In-Reply-To: <20191002105652.24821-1-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20191004175237.0F09C2741EF2@ypsilon.sirena.org.uk>
Date:   Fri,  4 Oct 2019 18:52:37 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191004175237.L3qR0yVL4Eq38zYlJo18QhIdaXdmAUqc-Vrpxb99xn8@z>

The patch

   ASoC: samsung: arndale: Simplify DAI link initialization

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From aaa68472ed1fa763336335f1278d65fcddd0056e Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 2 Oct 2019 12:56:50 +0200
Subject: [PATCH] ASoC: samsung: arndale: Simplify DAI link initialization

There is only one DAI link so we can drop an unnecessary loop statement.
Use card->dai_link in place of direct static arndale_rt5631_dai[] array
dereference as a prerequisite for adding support for other CODECs.
Unnecessary assignment of dai_link->codecs->name to NULL is removed.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Link: https://lore.kernel.org/r/20191002105652.24821-1-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/arndale_rt5631.c | 42 +++++++++++++-----------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index fd8c6642fb0d..004c84fafad9 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -88,36 +88,30 @@ static void arndale_put_of_nodes(struct snd_soc_card *card)
 
 static int arndale_audio_probe(struct platform_device *pdev)
 {
-	int n, ret;
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &arndale_rt5631;
+	struct snd_soc_dai_link *dai_link;
+	int ret;
 
 	card->dev = &pdev->dev;
+	dai_link = card->dai_link;
+
+	dai_link->cpus->of_node = of_parse_phandle(np, "samsung,audio-cpu", 0);
+	if (!dai_link->cpus->of_node) {
+		dev_err(&pdev->dev,
+			"Property 'samsung,audio-cpu' missing or invalid\n");
+		return -EINVAL;
+	}
 
-	for (n = 0; np && n < ARRAY_SIZE(arndale_rt5631_dai); n++) {
-		if (!arndale_rt5631_dai[n].cpus->dai_name) {
-			arndale_rt5631_dai[n].cpus->of_node = of_parse_phandle(np,
-					"samsung,audio-cpu", n);
-
-			if (!arndale_rt5631_dai[n].cpus->of_node) {
-				dev_err(&pdev->dev,
-				"Property 'samsung,audio-cpu' missing or invalid\n");
-				return -EINVAL;
-			}
-		}
-		if (!arndale_rt5631_dai[n].platforms->name)
-			arndale_rt5631_dai[n].platforms->of_node =
-					arndale_rt5631_dai[n].cpus->of_node;
-
-		arndale_rt5631_dai[n].codecs->name = NULL;
-		arndale_rt5631_dai[n].codecs->of_node = of_parse_phandle(np,
-					"samsung,audio-codec", n);
-		if (!arndale_rt5631_dai[0].codecs->of_node) {
-			dev_err(&pdev->dev,
+	if (!dai_link->platforms->name)
+		dai_link->platforms->of_node = dai_link->cpus->of_node;
+
+	dai_link->codecs->of_node = of_parse_phandle(np, "samsung,audio-codec", 0);
+	if (!dai_link->codecs->of_node) {
+		dev_err(&pdev->dev,
 			"Property 'samsung,audio-codec' missing or invalid\n");
-			ret = -EINVAL;
-			goto err_put_of_nodes;
-		}
+		ret = -EINVAL;
+		goto err_put_of_nodes;
 	}
 
 	ret = devm_snd_soc_register_card(card->dev, card);
-- 
2.20.1

