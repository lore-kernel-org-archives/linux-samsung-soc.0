From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: clock updates
Date: Fri, 25 Jun 2010 10:08:39 +0100
Message-ID: <20100625090839.GA22090@n2100.arm.linux.org.uk>
References: <20100623232422.GB16584@trinity.fluff.org> <AANLkTikIOfUS-hOs8ea3cqBntYJEFTD4pEFgte8qbMTH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:43458 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752724Ab0FYJJD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 05:09:03 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTikIOfUS-hOs8ea3cqBntYJEFTD4pEFgte8qbMTH@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Fri, Jun 25, 2010 at 05:38:20PM +0900, MyungJoo Ham wrote:
> However, what about devices and clocks with the same name and
> different id numbers (i.e., platform_device.id)? Are you going to add
> .id lookup to clkdev's clk_find? There are multiple clocks with the
> same name and different id number.

Platform devices are assigned names which are <basename>.<id> where id != -1.
The basename is matched by the driver.  The <basename>.<id> is what you
see in sysfs, and is the name of the underlying struct device.
