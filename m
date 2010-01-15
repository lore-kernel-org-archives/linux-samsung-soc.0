From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: Pull request for bjdooks' next-samsung tree
Date: Fri, 15 Jan 2010 09:03:39 +0000
Message-ID: <20100115090339.GD3738@trinity.fluff.org>
References: <20100115081602.GA14598@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:41205 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752950Ab0AOJDl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jan 2010 04:03:41 -0500
Content-Disposition: inline
In-Reply-To: <20100115081602.GA14598@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, gavin@simtec.co.uk, kgene.kim@samsung.com, thomas.ab@samsung.com, aditya.ps@samsung.com

Can we hold off on this, found a build error on s3c24xx.

Kukjin: please remove __init from the front of s5p_init_io definition
in arch/arm/plat-s3c/include/plat/cpu.h and re-submit the relevant
patch.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
