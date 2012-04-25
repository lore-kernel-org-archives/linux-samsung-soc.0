From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 00/33] Use common macro to define resources
Date: Wed, 25 Apr 2012 09:38:57 +0200
Message-ID: <201204250938.58397.heiko@sntech.de>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org> <20120425041939.GL9142@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:54479 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752142Ab2DYHjG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 03:39:06 -0400
In-Reply-To: <20120425041939.GL9142@game.jcrosoft.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org

Hi,

Am Mittwoch, 25. April 2012, 06:19:39 schrieb Jean-Christophe PLAGNIOL-
VILLARD:
> On 09:42 Wed 25 Apr     , Tushar Behera wrote:
> > There are some helper macros (DEFINE_RES_XXX) for defining resource
> > structures. This patchset migrates all the earlier resource
> > definitions (within Samsung specific code base) to use these macros.
> > 
> > In some cases, it was not possible to use DEFINE_RES_IRQ() macro because
> > of usage of additional flags. In those cases, DEFINE_RES_NAMED() macro
> > is used instead.
> > 
> > The patches are rebased on top of Kukjin's for-next branch at this
> > commit.
> > 
> > d0ee53a Merge branch 'next/board-samsung' into for-next
> 
> is this really necessary as we switch to DT this code will be droped

As far as I know legacy SoCs are allowed to keep being non-DT and I don't see 
the older Samsung SoCs (especially the S3C24XX ones) changing to DT anytime 
soon, as they don't see any new development but only bug fixes currently.


> for my point of view it's cosmetics change
it is, but it also makes the code more readable


Heiko
