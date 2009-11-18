From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [patch 0/4] [RFC] h1940 updates
Date: Wed, 18 Nov 2009 00:13:46 +0000
Message-ID: <20091118001346.GD23772@trinity.fluff.org>
References: <20091117135455.913565760@rtp-net.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:60054 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756398AbZKRANl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 19:13:41 -0500
Content-Disposition: inline
In-Reply-To: <20091117135455.913565760@rtp-net.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnaud.patard@rtp-net.org
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Tue, Nov 17, 2009 at 02:54:55PM +0100, arnaud.patard@rtp-net.org wrote:
> Hi,
> 
> This patchset gives an update to h1940 support. It contains:
> 
> - add mmc host device
> - add rtc device
> - add a lcd and backlight devices using platform-lcd and pwm-backlight
> - converts the bluetooth support to use the rfkill framework
> 
> This has been tested on a 2.6.31 and build tested on your next-s3c24xx-dev-updates branch.
> 
> Please, also note that I'm not really good at giving patch descriptions so feel
> free to correct them if needed.

I've put these in a branch, howerver it showing your realname
as 'arnaud.patard@rtp-net.org' so if you want this changing please
resubmit (privately will be ok) with a better realname in the email

Also, it left 'Content-Disposition: inline; filename=h1940_lcd_backlight.patch
' in the patch.

Please also wrap descriptions to 77 or less characters per line.

If possible, prefix subjects with 'ARM: H1940' instead of 'h1940:'

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
