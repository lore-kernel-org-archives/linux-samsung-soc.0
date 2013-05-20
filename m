From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC 0/2] clk: samsung: add composite clocks
Date: Mon, 20 May 2013 16:14:30 +0200
Message-ID: <201305201614.31103.heiko@sntech.de>
References: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39271 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756270Ab3ETOOf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 10:14:35 -0400
In-Reply-To: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com

Am Montag, 20. Mai 2013, 16:17:06 schrieb Rahul Sharma:
> This patch adds support for composite clocks for samsung SoCs.
> Many drivers need access to a common clock which support gating
> and/or muxing and/or rate control operations. For example hdmi
> which needs to switch between parents and call enable/disable for
> "sclk_hdmi".
> 
> This patch set also adds composite clock for exyno5250 hdmi. Based
> on the review comment, I will extended this to other exynos SoCs
> clocks files.

I think I remember reading somewhere that the target of the common clock 
framework was to prevent every SoC from introducing their own special clock 
types and instead  create these structures from separate clocks (mux clk + 
gate clk) and not to have every SoC create their own custom clock types.

The Samsung clock drivers at the moment follow this paradigm of combining the 
existing "simple" clocks and only introduce new clock types for the pll 
clocks, that really need special handling.

So it would probably good to keep it this way and define your clocks from 
their individual components, as all the other Samsung clocks currently do.


Heiko
