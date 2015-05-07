From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] mtd: mxc-nand: Constify platform_device_id
Date: Thu, 7 May 2015 00:14:01 -0700
Message-ID: <20150507071401.GI6055@norris-Latitude-E6410>
References: <1430495403-31560-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:36353 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873AbbEGHOG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 May 2015 03:14:06 -0400
Content-Disposition: inline
In-Reply-To: <1430495403-31560-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Sat, May 02, 2015 at 12:50:01AM +0900, Krzysztof Kozlowski wrote:
> The platform_device_id is not modified by the driver and core uses it as
> const.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Pushed all 3 to l2-mtd.git.

Brian
