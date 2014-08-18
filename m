From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v5 01/10] ARM: dts: Fix MMC pinctrl for exynos5250-snow
Date: Mon, 18 Aug 2014 13:37:22 -0500
Message-ID: <53F247E2.2070007@samsung.com>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>	<1406868897-26874-2-git-send-email-afaerber@suse.de> <CAD=FV=VBa5rs_woj0mshFFbA69Nhyi3hXK_XX7-54T3vFyKYHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:35957 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751860AbaHRSh1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 14:37:27 -0400
In-Reply-To: <CAD=FV=VBa5rs_woj0mshFFbA69Nhyi3hXK_XX7-54T3vFyKYHA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

On 08/01/14 11:26, Doug Anderson wrote:
> Hi,
>
Hi,

> On Thu, Jul 31, 2014 at 9:54 PM, Andreas F=C3=A4rber<afaerber@suse.de=
>  wrote:
>> The pinctrl properties should be on the device directly and not on t=
he
>> slot sub-node.
>>
>> Reported-by: Doug Anderson<dianders@chromium.org>
>> Cc: Jaehoon Chung<jh80.chung@samsung.com>
>> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>> Signed-off-by: Andreas F=C3=A4rber<afaerber@suse.de>
>
> Let's land this one before Jaehoon's, since it was a hidden
> functionality change in his patch.  It will be an easy conflict to
> resolve when his patch is applied.
>
Sounds good to me, I've applied this before Jaehoon's change.

> Reviewed-by: Doug Anderson<dianders@chromium.org>

Thanks,
Kukjin
