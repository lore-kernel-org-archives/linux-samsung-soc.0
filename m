From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH 1/3] regulator: s2mpxxx: Move regulator min/step voltages
 in common place
Date: Thu, 10 Jul 2014 08:52:23 +0530
Message-ID: <CADGdYn4tkt7PAjK8fL9JmF43MW6P0+UeyGzZrrgHTqj08et17w@mail.gmail.com>
References: <1404822480-31525-1-git-send-email-amit.daniel@samsung.com>
	<20140709092511.GP30458@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:51734 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861AbaGJDWX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 23:22:23 -0400
In-Reply-To: <20140709092511.GP30458@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 9, 2014 at 2:55 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Jul 08, 2014 at 05:57:58PM +0530, Amit Daniel Kachhap wrote:
>
>>  include/linux/mfd/samsung/core.h    | 21 ++++++++++++++++
>>  include/linux/mfd/samsung/s2mpa01.h | 12 ---------
>>  include/linux/mfd/samsung/s2mps11.h |  9 -------
>>  include/linux/mfd/samsung/s2mps14.h | 10 --------
>
> You need to send patches to the MFD subsystem to the MFD maintainers as
> well.

Thanks for the pointer. Will submit to MFD maintainers.
