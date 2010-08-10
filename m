From: Daniel Walker <dwalker@codeaurora.org>
Subject: Re: [GIT PULL] Samsung S5P updates for 2.6.36 merge window
Date: Tue, 10 Aug 2010 10:55:11 -0700
Message-ID: <1281462911.9400.10.camel@c-dwalke-linux.qualcomm.com>
References: <017201cb37ac$9979a5a0$cc6cf0e0$%kim@samsung.com>
	 <1281462308.9400.7.camel@c-dwalke-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:11710 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932260Ab0HJRzV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Aug 2010 13:55:21 -0400
In-Reply-To: <1281462308.9400.7.camel@c-dwalke-linux.qualcomm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org

On Tue, 2010-08-10 at 10:45 -0700, Daniel Walker wrote:
> On Mon, 2010-08-09 at 19:21 +0900, Kukjin Kim wrote:
> >  arch/arm/Kconfig                                 |   37 +-
> >  arch/arm/Makefile                                |    1 + 


Sorry, just realized this is going to Russell .. The reason I commented
on it is because this code has been in -next for a long time, and it
sitting in -next will just cause conflicts when Russell accepts other
mods to Kconfig .. So if you don't care about the conflict I guess it
doesn't matter ..

Daniel

-- 
Sent by an consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
