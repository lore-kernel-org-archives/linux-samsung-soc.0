From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] ARM: plat-samsung: use Kconfig choice for debug UART selection
Date: Mon, 10 Oct 2011 19:08:56 +0530
Message-ID: <CAJuYYwToW7Ac+Fh1J0oEBJnXjG93GJBbkL-SOX_jsgk-PWi=BQ@mail.gmail.com>
References: <1313530873-24961-1-git-send-email-will.deacon@arm.com>
	<1313530873-24961-2-git-send-email-will.deacon@arm.com>
	<CAJuYYwRPwALAQcvsMPuz8XYsDicCmB52HzZehppUnKqv5itPEQ@mail.gmail.com>
	<20111010122319.GE2451@mudshark.cambridge.arm.com>
	<CAJuYYwQiXSSOQ_FvOn41NSUJ6F4axNbYgV-LfOxhhLvbUz-bMQ@mail.gmail.com>
	<20111010133455.GH2451@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:55983 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753031Ab1JJNi5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 09:38:57 -0400
Received: by gyg10 with SMTP id 10so5322966gyg.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Oct 2011 06:38:56 -0700 (PDT)
In-Reply-To: <20111010133455.GH2451@mudshark.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 10 October 2011 19:04, Will Deacon <will.deacon@arm.com> wrote:
> On Mon, Oct 10, 2011 at 01:35:54PM +0100, Thomas Abraham wrote:
>> There are no difficulties with the original patch. But that was not
>> how Samsung boards have been selecting the low level debug uart port
>> number. The proposed patch tried to maintain the old style.
>>
>> Another point is that Samsung's Exynos4 (and few other SoC's) has a
>> fourth UART port as well. Not that it is used as a debug port
>> currently, but there is no technical limitation in using that as a
>> console port. So that might need 'DEBUG_S3C_UART3' as well.
>
> Tell you what then: let's stick with the original patch for now and then you
> can refactor the Samsung bit in the future if/when you add support for the
> fourth UART. Does that sound OK?

Yes. That sounds fine. Thanks for having a look at the proposed diff.

Regards,
Thomas.

>
> Will
>
