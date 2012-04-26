From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 00/33] Use common macro to define resources
Date: Thu, 26 Apr 2012 09:23:07 +0530
Message-ID: <4F98C6A3.1060700@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org> <201204250938.58397.heiko@sntech.de> <20120425101007.GM9142@game.jcrosoft.org> <201204251121.47358.arnd@arndb.de> <20120425113521.GW24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:51638 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876Ab2DZDxO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 23:53:14 -0400
Received: by dadz8 with SMTP id z8so960864dad.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Apr 2012 20:53:14 -0700 (PDT)
In-Reply-To: <20120425113521.GW24211@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org

On 04/25/2012 05:05 PM, Russell King - ARM Linux wrote:
> On Wed, Apr 25, 2012 at 11:21:47AM +0000, Arnd Bergmann wrote:
>> Note that the point of the DEFINE_RES_*() macros is really to prevent
>> people from coming up with new silly macros to do the same thing, as
>> we've had in the past.
> 
> One of the other reaons was to stop the stream of resources with wrong
> endings (because people kept thinking it was exclusive rather than
> inclusive) - and the resulting stream of additional patches to fix those
> errors.
> 
Patch 16, 18, 24 seemed to touch that problem. It was fixed in patches
16 and 24. There was not much clarity regarding the situation in patch
18, so it was left as it was.

-- 
Tushar Behera
