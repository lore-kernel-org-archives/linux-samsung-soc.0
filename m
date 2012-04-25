From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/33] Use common macro to define resources
Date: Wed, 25 Apr 2012 11:21:47 +0000
Message-ID: <201204251121.47358.arnd@arndb.de>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org> <201204250938.58397.heiko@sntech.de> <20120425101007.GM9142@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:54034 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757857Ab2DYLYn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 07:24:43 -0400
In-Reply-To: <20120425101007.GM9142@game.jcrosoft.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org

On Wednesday 25 April 2012, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > 
> > As far as I know legacy SoCs are allowed to keep being non-DT and I don't see 
> > the older Samsung SoCs (especially the S3C24XX ones) changing to DT anytime 
> > soon, as they don't see any new development but only bug fixes currently.
> > 
> > 
> > > for my point of view it's cosmetics change
> > it is, but it also makes the code more readable
> we get comment from Linus to do not do cosmetic changes
> 
> so if it work well I'll not touch it

I would leave this up for the platform maintainers to decide individually,
as there is no easy answer.

Generally cleanups are welcome and the patch series has the nice effect of
removing a few hundred lines from the platform, which is good. On the other
hand I agree that we should not mess too much with legacy platforms: If
something is in the state where we just want to keep it running and not
get it up to modern coding standards, we shouldn't be doing those changes,
but if a platform is important enough to warrant such cleanups, we should
go the full way and make it use all the right subsystems and use DT instead
of board files.

Note that the point of the DEFINE_RES_*() macros is really to prevent
people from coming up with new silly macros to do the same thing, as
we've had in the past. Converting existing code that is just open-coding
the resources to use these macros is just noise IMHO. If Kukjin Kim wants
to take those patches, I won't complain though.

	Arnd
