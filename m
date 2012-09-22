From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/5] ARM: Add interface for registering and calling
	firmware-specific operations
Date: Sat, 22 Sep 2012 14:22:32 +0100
Message-ID: <20120922132232.GL15609@n2100.arm.linux.org.uk>
References: <1347524018-19301-1-git-send-email-t.figa@samsung.com> <1347524018-19301-3-git-send-email-t.figa@samsung.com> <20120922055015.GD32245@quad.lixom.net> <CAH9JG2XFVzyZH8rsBogVYRdD4dzWpKjX8JAQw0Sf7qJqgueqAg@mail.gmail.com> <20120922062322.GA6264@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:38053 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751468Ab2IVNWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Sep 2012 09:22:45 -0400
Content-Disposition: inline
In-Reply-To: <20120922062322.GA6264@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de

On Fri, Sep 21, 2012 at 11:23:22PM -0700, Olof Johansson wrote:
> static void __iomem *default_cpu_boot_reg(int cpu)
> {
> 	return (void __iomem *)0;
> }

NULL is perfectly acceptable here.
