From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 5/10] ARM: S5PV210: Add SCLK_SPDIF clock
Date: Tue, 5 Oct 2010 09:30:27 +0900
Message-ID: <AANLkTinz98X+L9-VeaL9nkUi1LKPtajibR3=d9ipXmns@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286193154-17201-1-git-send-email-sw.youn@samsung.com>
	<20101004183903.GF2835@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:48252 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754369Ab0JEAa2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 20:30:28 -0400
Received: by bwz11 with SMTP id 11so4191949bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Oct 2010 17:30:27 -0700 (PDT)
In-Reply-To: <20101004183903.GF2835@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, alsa-devel@alsa-project.org, kgene.kim@samsung.com, jassi.brar@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

On Tue, Oct 5, 2010 at 3:39 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Oct 04, 2010 at 08:52:34PM +0900, Seungwhan Youn wrote:
>> This patch add SCLK_SPDIF clock to support source clock of S/PDIF
>> on S5PV210.
>>
>> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
>
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
>
> but this looks like an example of where the get and set rate operations
> could readily be shared as mentioned in reply to the previous patch.

Please see this in context of my reply to your previous comment.
