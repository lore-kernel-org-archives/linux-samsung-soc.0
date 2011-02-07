From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/7] ASoC: neo1973_wm8753: Remove scenario
 management code.
Date: Mon, 7 Feb 2011 11:25:17 +0900
Message-ID: <AANLkTinOHBA9YHyt8s1PgiJoDNpiOw8EZywt5kwJwTx-@mail.gmail.com>
References: <1297033463-14577-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:58131 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754293Ab1BGCZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Feb 2011 21:25:19 -0500
In-Reply-To: <1297033463-14577-1-git-send-email-lars@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>

On Mon, Feb 7, 2011 at 8:04 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:
> It has been proven to be inflexible to do scenario management in kernel space.
>
> Since actual neo1973 board support has not been merged in mainline and this
> patch has been in the neo1973 tree for some time now it should be safe to remove
> this functionality without breaking existing userspace.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

All
Acked-by: Jassi Brar <jassi.brar@samsung.com>
