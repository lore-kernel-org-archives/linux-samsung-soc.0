From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 0/2] s3c24xx: fix s3cmci DMA support
Date: Wed, 08 Sep 2010 00:14:48 +0100
Message-ID: <4C86C768.2000100@fluff.org>
References: <1283872143-32492-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:38916 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751006Ab0IGXOy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 19:14:54 -0400
In-Reply-To: <1283872143-32492-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Kleffel <tk@maintech.de>

On 07/09/10 16:09, Vasily Khoruzhick wrote:
> This series fixes DMA support for s3c24xx SoCs, now it's
> possible to use DMA with s3cmci driver. It was tested on
> rx1950 (s3c2442), h1940 (s3c2410) and freerunner (s3c2442),
> unfortunately s3cmci doesn't work with SDIO cards when DMA
> is enabled, but at least patch breaks nothing - sound works
> OK on freerunner, and it's still possible to use PIO.

hmm, i've not got 1/2 of this?
