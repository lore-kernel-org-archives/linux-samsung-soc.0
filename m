From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 2/3] ARM: plat-samsung: use Kconfig choice for debug UART
 selection
Date: Mon, 10 Oct 2011 14:34:55 +0100
Message-ID: <20111010133455.GH2451@mudshark.cambridge.arm.com>
References: <1313530873-24961-1-git-send-email-will.deacon@arm.com>
 <1313530873-24961-2-git-send-email-will.deacon@arm.com>
 <CAJuYYwRPwALAQcvsMPuz8XYsDicCmB52HzZehppUnKqv5itPEQ@mail.gmail.com>
 <20111010122319.GE2451@mudshark.cambridge.arm.com>
 <CAJuYYwQiXSSOQ_FvOn41NSUJ6F4axNbYgV-LfOxhhLvbUz-bMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:38419 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753029Ab1JJNfB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 09:35:01 -0400
Content-Disposition: inline
In-Reply-To: <CAJuYYwQiXSSOQ_FvOn41NSUJ6F4axNbYgV-LfOxhhLvbUz-bMQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Mon, Oct 10, 2011 at 01:35:54PM +0100, Thomas Abraham wrote:
> There are no difficulties with the original patch. But that was not
> how Samsung boards have been selecting the low level debug uart port
> number. The proposed patch tried to maintain the old style.
> 
> Another point is that Samsung's Exynos4 (and few other SoC's) has a
> fourth UART port as well. Not that it is used as a debug port
> currently, but there is no technical limitation in using that as a
> console port. So that might need 'DEBUG_S3C_UART3' as well.

Tell you what then: let's stick with the original patch for now and then you
can refactor the Samsung bit in the future if/when you add support for the
fourth UART. Does that sound OK?

Will
