From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Default machine include placements
Date: Mon, 25 Jan 2010 10:05:47 +0000
Message-ID: <20100125100546.GA16340@n2100.arm.linux.org.uk>
References: <20100125040255.GN26562@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:44410 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932131Ab0AYKGI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2010 05:06:08 -0500
Content-Disposition: inline
In-Reply-To: <20100125040255.GN26562@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>

On Mon, Jan 25, 2010 at 04:02:56AM +0000, Ben Dooks wrote:
> Currently in the s3c/s5p familt we're seeing quite a number of the
> same things being repeated for items like entry-macro.S, hardware.h
> and so on.
> 
> The first question is about adding include/mach directories to
> eitehr plat-s5p or plat-samsung to mop up the files that keep
> getting repeated (since the plat-* directories are processed after
> the machine directory includes the mach-xxx are still free to overide
> these as necessary)
> 
> The second question is whether some of these files should have defaults
> in arch/arm/include? I think this might be less useful as build failures
> for new ports ensure that at-least these files are thought about

No - doing this means it's harder to find out what's going on.  Rather
than being able to look in arch/arm/mach-*/include for the relevant
mach header file and know you've got the right one, you have to instead
consider whether the one you're using is the one found in
arch/arm/mach-*/include/mach, arch/arm/plat-*/include/mach or
arch/arm/include/mach.

Having multiple places where include files can live is a nightmare; you
only have to look at glibc to know that - where you have to search the
entire source looking for the header file you want.
