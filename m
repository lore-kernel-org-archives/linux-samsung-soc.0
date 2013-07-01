From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add WM1811A audio CODEC to Arndale bindings
Date: Mon, 1 Jul 2013 18:47:00 -0300
Message-ID: <CAOMZO5DZb1wWu93eEHkEqNORhm_hn6qy_LdiRSumP7UODJ3uMw@mail.gmail.com>
References: <1372714599-17588-1-git-send-email-broonie@kernel.org>
	<1372714599-17588-3-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f47.google.com ([209.85.212.47]:59597 "EHLO
	mail-vb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755100Ab3GAVrB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jul 2013 17:47:01 -0400
Received: by mail-vb0-f47.google.com with SMTP id x14so3999606vbb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jul 2013 14:47:00 -0700 (PDT)
In-Reply-To: <1372714599-17588-3-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@linaro.org>

On Mon, Jul 1, 2013 at 6:36 PM, Mark Brown <broonie@kernel.org> wrote:

>         i2c@12C90000 {
> -               status = "disabled";
> +               wm1811a@11 {
> +                       compatible = "wlf,wm1811";
> +                       reg = <0x1a>;

Shouldn't it be reg = <0x11> ? Or wm1811a@1a ?
