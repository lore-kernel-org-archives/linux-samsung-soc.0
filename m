From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 0/8] arch: arm64: Enable support for Samsung Exynos7
 SoC
Date: Mon, 22 Sep 2014 10:52:39 +0200
Message-ID: <541FE357.5090000@gmail.com>
References: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:60979 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752723AbaIVIwm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 04:52:42 -0400
In-Reply-To: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, catalin.marinas@arm.com
Cc: naveenkrishna.ch@gmail.com, kesavan.abhilash@gmail.com

Hi Abhilash,

On 22.09.2014 06:47, Abhilash Kesavan wrote:
> Changes since v4:
> - Fixed comments from Tomasz Figa:
> 	- Changed the namespace prefix from exynos to samsung
> 	- Defined bindings to take all input clocks
> 	- Sorted the Kconfig entries alphabetically in clock Makefile
> 	- Used consistent 1 tab line breaks across the clock file
> 	- Statically initialized the samsung_cmu_info struct
> - Enabled exynos7 in the arm64 defconfig as per Catalin Marinas' comment.
> - Added Kukjin Kim's ack along with Thomas Abraham's tested and reviewed tags.
> 

The clock patches look good to me, but since they are doing quite a lot
of code moving I'd prefer to take them through clk tree. Based on the
fact that there are no code dependencies between clock patches and
remaining ones and Exynos7 is a new material for 3.18, I'm inclined to
apply them to my tree if nobody minds.

Best regards,
Tomasz
