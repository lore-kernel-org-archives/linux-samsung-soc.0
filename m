From: Frans Pop <elendil@planet.nl>
Subject: Re: spi_s3c64xx.c - plat/spi.h: No such file or directory
Date: Thu, 11 Mar 2010 05:57:31 +0100
Message-ID: <201003110557.32936.elendil@planet.nl>
References: <201003100911.06148.elendil@planet.nl> <201003110442.24196.elendil@planet.nl> <1b68c6791003102002l43de16ccq949b28a9fb856253@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from Cpsmtpm-eml107.kpnxchange.com ([195.121.3.11]:54006 "EHLO
	CPSMTPM-EML107.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756495Ab0CKE5f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 23:57:35 -0500
In-Reply-To: <1b68c6791003102002l43de16ccq949b28a9fb856253@mail.gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

On Thursday 11 March 2010, jassi brar wrote:
> Then you need patches from Grant Likely's tree.
> The driver now includes a new header plat/s3c64xxx-spi.h instead

> Check http://git.secretlab.ca/?p=linux-2.6.git;a=summary
> branch 'next' or 'next-spi'

Yep, that does work! Thanks a lot for your patience.

Cheers,
FJP
