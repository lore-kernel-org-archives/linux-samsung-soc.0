From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 5/9] ARM: EXYNOS: add board file for SMDK5250
Date: Wed, 1 Feb 2012 09:34:23 +0000
Message-ID: <20120201093423.GA3002@mudshark.cambridge.arm.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-6-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2UZ9HxXsvmTh8Gqf5EpzS2sLSH_v8TWjKeBL8z7hR++Mg@mail.gmail.com>
 <CAOesGMgNdDdzsSBtopu7hu0xavFDSBnw0TW1MrN25C7FO+j8AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:46539 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753188Ab2BAJfJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 04:35:09 -0500
Content-Disposition: inline
In-Reply-To: <CAOesGMgNdDdzsSBtopu7hu0xavFDSBnw0TW1MrN25C7FO+j8AQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kyungmin Park <kmpark@infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>

On Wed, Feb 01, 2012 at 08:50:23AM +0000, Olof Johansson wrote:
> On Tue, Jan 31, 2012 at 8:20 PM, Kyungmin Park <kmpark@infradead.org> wrote:
> > As I remember only DT based board file is acceptable for mainline?
> 
> For a new SoC family like 5250 it would be much preferred to only add
> device-tree enabled boards.

As I mentioned in an earlier thread, it would also solve the problem of
enumerating the CPU topology on A15 (without resorting to flaky hacks in
core code).

Will
