From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2] ARM: Kconfig: let ARM9TDMI and ARM7TDMI invisible.
Date: Wed, 24 Apr 2013 18:46:02 +0100
Message-ID: <20130424174602.GA14496@n2100.arm.linux.org.uk>
References: <51775BB3.6000607@asianux.com> <51775D88.2000406@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:38079 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756438Ab3DXRqa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Apr 2013 13:46:30 -0400
Content-Disposition: inline
In-Reply-To: <51775D88.2000406@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chen Gang <gang.chen@asianux.com>
Cc: Will Deacon <will.deacon@arm.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>

On Wed, Apr 24, 2013 at 12:20:24PM +0800, Chen Gang wrote:
> If CONFIG_MMU is disabled, it will let ARM9TDMI and ARM7TDMI visible,
> but in fact, only AT91X40 need ARM7TDMI, so need not let them visible.

I'll apply it myself this evening.  Can I add:

Tested-by: Chen Gang <gang.chen@asianux.com>

to it?
