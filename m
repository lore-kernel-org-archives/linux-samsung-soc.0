From: amit kachhap <amit.kachhap@gmail.com>
Subject: Re: [PATCH V3 2/6] ARM: s5p: remove useless churn in sleep.S
Date: Wed, 23 Nov 2011 14:18:32 +0530
Message-ID: <CADGdYn4XHr7t6+bcz+iWMZ0pSK8=UUy+GYuQ9gi13LRPqCdjNg@mail.gmail.com>
References: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
	<1321954532-18724-3-git-send-email-amit.kachhap@linaro.org>
	<20111122094821.GU9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:43678 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810Ab1KWIsd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Nov 2011 03:48:33 -0500
Received: by qadc14 with SMTP id c14so2219940qad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2011 00:48:32 -0800 (PST)
In-Reply-To: <20111122094821.GU9581@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On Tue, Nov 22, 2011 at 3:18 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Nov 22, 2011 at 03:05:28PM +0530, Amit Daniel Kachhap wrote:
>> This patch cleans up sleep code in preparation for L2 resume code
>> and hotplug functions
>
> I wonder whether anyone read the comments in this file before they
> changed the section for the code.
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * sleep magic, to allow the bootloader to check for a=
n valid
> =A0 =A0 =A0 =A0 * image to resume to. Must be the first word before t=
he
> =A0 =A0 =A0 =A0 * s3c_cpu_resume entry.
> =A0 =A0 =A0 =A0 */

Ok,This looks like an error. Thanks for pointing this out. Will put
the entire section into data.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
