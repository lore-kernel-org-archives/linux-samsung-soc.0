From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH 07/17] ARM: S5PC1xx: add gpiolib and external/gpio
	interrupt support
Date: Fri, 6 Nov 2009 12:23:01 +0900
Message-ID: <20091106032301.GK3913@prithivi.gnumonks.org>
References: <1255421482-26455-1-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-2-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-3-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-4-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-5-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-6-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-7-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-8-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60359 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755081AbZKFDdE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2009 22:33:04 -0500
Content-Disposition: inline
In-Reply-To: <1255421482-26455-8-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

On Tue, Oct 13, 2009 at 10:11:12AM +0200, Marek Szyprowski wrote:
> Add support for gpiolib calls. This is based on the gpiolib implementation
> from plat-s3c64xx tree.

I think this is also the right way.  We definitely want gpiolib support.

Ben, what do you think?

Regards,
	Harald
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
