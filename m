From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/2] ARM: S3C64xx: cpuidle cleanups
Date: Mon, 14 May 2012 10:52:46 +0200
Message-ID: <201205141052.47567.heiko@sntech.de>
References: <1336572489-21457-1-git-send-email-daniel.lezcano@linaro.org> <4FB048E4.8070405@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:35966 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755387Ab2ENIw5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 04:52:57 -0400
In-Reply-To: <4FB048E4.8070405@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, linaro-dev@lists.linaro.org, patches@linaro.org

Am Montag, 14. Mai 2012, 01:51:00 schrieb Daniel Lezcano:
> On 05/09/2012 04:08 PM, Daniel Lezcano wrote:
> > These couple of patches use the new cpuidle core api to refactor
> > some part of the code. The first one declares the states directly
> > in the driver declaration and the second one use the timekeeping
> > flag to let the cpuidle core to compute the idle time.
> > 
> > I don't have this board, I was not able to test these patches.
> > 
> > Daniel Lezcano (2):
> >    ARM: s3c64xx: cpuidle - declare the states with the new api
> >    ARM: s3c64xx: cpuidle - use timekeeping wrapper
> 
> Are these patches ok for inclusion ?

you might want to include the maintainer

	Kukjin Kim <kgene.kim@samsung.com>

and the samsung list

	linux-samsung-soc@vger.kernel.org

into your recipients


Heiko
