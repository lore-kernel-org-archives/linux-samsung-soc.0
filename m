From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/10] ARM: S5PC100: Add SCLK_SPDIF clock
Date: Tue, 5 Oct 2010 09:29:09 +0900
Message-ID: <AANLkTimZLQLRP33e_1ZbHOLYOToHXjhyjY09F9gb7q+b@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286192545-18327-1-git-send-email-sw.youn@samsung.com>
	<20101004183041.GD2835@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:62922 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752703Ab0JEA3L convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 20:29:11 -0400
Received: by bwz11 with SMTP id 11so4190984bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Oct 2010 17:29:09 -0700 (PDT)
In-Reply-To: <20101004183041.GD2835@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, alsa-devel@alsa-project.org, kgene.kim@samsung.com, jassi.brar@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

On Tue, Oct 5, 2010 at 3:30 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Oct 04, 2010 at 08:42:25PM +0900, Seungwhan Youn wrote:
>> This patch add SCLK_SPDIF clock to support source clock of S/PDIF
>> on S5PC100.
>>
>> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
>
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
>
> but...
>
>> +static int s5pc100_spdif_set_rate(struct clk *clk, unsigned long ra=
te)
>> +{
>> + =C2=A0 =C2=A0 struct clk *pclk;
>> + =C2=A0 =C2=A0 int ret;
>
> This and the get() look like they're generic (they just proxy the
> operation on to the parent clock, which I imagine applies to a bunch =
of
> other clocks too.

Yes, that should apply to all Mux-Out and PAD 'clocks'.
I plan to submit a patch to have that feature in Samsung clock API --
call parent's operators
if the clock doesn't have one.
Since that might be a controversial change and hence delays in
acceptance (if at all),
we decided to do that for the devices that need it for now.
