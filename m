From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: approaching last call for updatyes
Date: Mon, 17 May 2010 06:00:38 +0100
Message-ID: <20100517050038.GU26401@trinity.fluff.org>
References: <20100513091540.GK26401@trinity.fluff.org> <AANLkTimHifdCStUZJ_Xgyf2n5mA47Jdj2zscWNB13LDq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:34215 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752067Ab0EQFAk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 01:00:40 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimHifdCStUZJ_Xgyf2n5mA47Jdj2zscWNB13LDq@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: christian pellegrin <chripell@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, May 13, 2010 at 11:37:30AM +0200, christian pellegrin wrote:
> The fix for NAND clock stop on idle is missing. Without it I suggest
> to mark the option CONFIG_MTD_NAND_S3C2410_CLKSTOP broken.

this is something for the relevant mtd maintainer to merge.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
