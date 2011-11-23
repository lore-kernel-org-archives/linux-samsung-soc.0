From: amit kachhap <amit.kachhap@gmail.com>
Subject: Re: [PATCH V3 3/6] ARM: exynos: save L2 settings during bootup
Date: Wed, 23 Nov 2011 12:22:48 +0530
Message-ID: <CADGdYn6HCbT23x+asqYo=fvc8z1-oaPGqXxZP793dVwx9NZ=xQ@mail.gmail.com>
References: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
	<1321954532-18724-4-git-send-email-amit.kachhap@linaro.org>
	<20111122094925.GV9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:33666 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757426Ab1KWGws convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Nov 2011 01:52:48 -0500
Received: by mail-gx0-f174.google.com with SMTP id r5so1087419ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Nov 2011 22:52:48 -0800 (PST)
In-Reply-To: <20111122094925.GV9581@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On Tue, Nov 22, 2011 at 3:19 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Nov 22, 2011 at 03:05:29PM +0530, Amit Daniel Kachhap wrote:
>> This patch adds code to save L2 register configuration at boot, and
>> later used to resume L2 before MMU is enabled in suspend and cpuidle
>> resume paths.
>
> Is there a reason exynos isn't using the generic l2 code?

Actually the generic l2 save/resume works fine for full l2 shutdown
but in case of l2 retention mode few registers need to be
re-initialised which is not handled in the generic code.(implemented
in file arch/arm/plat-s5p/sleep.S)

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
