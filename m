From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mmc: dt: Add 'broken-cd' DT binding
Date: Tue, 21 Aug 2012 11:01:21 +0000
Message-ID: <201208211101.21612.arnd@arndb.de>
References: <1345547371-6784-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:59222 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756566Ab2HULBb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Aug 2012 07:01:31 -0400
In-Reply-To: <1345547371-6784-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, cjb@laptop.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, patches@linaro.orgChris Ball <cjb@laptop.org>

On Tuesday 21 August 2012, Thomas Abraham wrote:
> diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
> index 8a6811f..1aa527a 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/mmc.txt
> @@ -16,6 +16,8 @@ Optional properties:
>  - wp-inverted: when present, polarity on the wp gpio line is inverted
>  - non-removable: non-removable slot (like eMMC)
>  - max-frequency: maximum operating clock frequency
> +- broken-cd: when present, indicates that the cd-gpios line is not
> +       connected to the card-detect pad of the MMC host controller.

What is the difference between listing the cd line as broken and
listing no cd line at all?

	Arnd
