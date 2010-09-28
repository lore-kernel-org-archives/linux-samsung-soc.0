From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3] regulators: add support max8952 regulator
Date: Tue, 28 Sep 2010 17:03:37 +0900
Message-ID: <AANLkTi=nE5Z1uMKuzTWE+eG9Dh_e11nJ5hh-0AS7hyhe@mail.gmail.com>
References: <1283901976-32588-1-git-send-email-kgene.kim@samsung.com>
	<01a401cb4f01$73d60ac0$5b822040$%park@samsung.com>
	<006201cb5ee3$0100fc20$0302f460$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:42570 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752617Ab0I1IDi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 04:03:38 -0400
In-Reply-To: <006201cb5ee3$0100fc20$0302f460$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk, Changhwan Youn <chaos.youn@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Tue, Sep 28, 2010 at 4:58 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Kukjin Kim wrote:
>>
>> Kyungmin Park wrote:
>> >
>> > Do you check the DVS feature?
>> > It can support the DVS by GPIOs and platform can set the each volt=
ages
> at
>> > each mode.
>> >
>> Ok...I agree about the feature's necessity that you said.
>>
>> However, we don't need separate driver which has same/similar
> functionality.
>> So...would be better that could implement it in max8649...
>>
>> Could you please do it based on this?...in fact, can't test it on SM=
DK.
>>
> Hmm...
> Kyungmin, if you have no time to do it, my team will do it.
>
> Is it ok?
No problem, go ahead.

Thank you,
Kyungmin Park
>
>> Thanks.
>>
>> Best regards,
>> Kgene.
>> --
>> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
>> SW Solution Development Team, Samsung Electronics Co., Ltd.
>>
>> > As quick review of max8649. It can't support it.
>> >
>> > Thank you,
>> > Kyungmin Park
>> >
>> > -----Original Message-----
>> > From: Kukjin Kim [mailto:kgene.kim@samsung.com]
>> > Sent: Wednesday, September 08, 2010 8:26 AM
>> > To: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead=
=2Eorg;
>> > linux-samsung-soc@vger.kernel.org
>> > Cc: lrg@slimlogic.co.uk; Changhwan Youn; Kukjin Kim; MyungJoo Ham;
>> Kyungmin
>> > Park
>> > Subject: [PATCH v3] regulators: add support max8952 regulator
>> >
>> > From: Changhwan Youn <chaos.youn@samsung.com>
>> >
>> > The operation of max8952 is almost similar to max8649 except the o=
utput
>> > voltage range. This patch adds support the max8952 regulator using
>> > current max8649 implementation. And removes separate max8952.[ch] =
files
>> > since the functionality is now merged into this driver.
>> >
>> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
>> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> > Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
>> > ---
>> > Following is as per Mark Brown's suggestion.
>> > Changes since v2:
>> > - Removed separate max8952.[ch] files
>> >
>> > Changes since v1:
>> > - Added returning fail when detected wrong ID
>> > - Added matching the ID from the chip in case the user got things =
wrong
>> > - Added enum chip ID instead of 0, 1
>> >
>> (snip)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
