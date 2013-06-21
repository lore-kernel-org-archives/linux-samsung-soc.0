From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V10 0/4] PCIe support for Samsung Exynos5440 SoC
Date: Fri, 21 Jun 2013 10:30:47 +0200
Message-ID: <201306211030.47440.arnd@arndb.de>
References: <003901ce6e50$03d039a0$0b70ace0$@samsung.com> <201306210931.58428.arnd@arndb.de> <20130621094723.312bc331@skate>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:55294 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161250Ab3FUIb0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 04:31:26 -0400
In-Reply-To: <20130621094723.312bc331@skate>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jingoo Han <jg1.han@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Bjorn Helgaas' <bhelgaas@google.com>, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Andrew Murray' <andrew.murray@arm.com>, 'Thierry Reding' <thierry.reding@avionic-design.de>, 'Jason Gunthorpe' <jgunthorpe@obsidianresearch.com>, 'Surendranath Gurivireddy Balla' <suren.reddy@samsung.com>, 'Siva Reddy Kallam' <siva.kallam@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Pratyush Anand' <pratyush.anand@st.com>, 'Mohit KUMAR' <Mohit.KUMAR@st.com>, Jason Cooper <jason@lakedaemon.net>

On Friday 21 June 2013, Thomas Petazzoni wrote:
> I am by far not an expert on how to solve merge strategies and so on,
> but to avoid conflicts at Linus's level while merging the arm-soc and
> pci trees, it would be better if this Samsung PCIe driver could go
> through arm-soc (with Bjorn ACK, of course), so that Arnd/Olof can
> make sure the ordering is correct with regard to the of/pci changes and
> the mvebu/pci driver.

Yes, good point.

The alternative would be that Bjorn also takes the PCI branch dependencies
that are already in arm-soc into his tree. Either way works, but I agree
that what you suggest would be simpler.

	Arnd
