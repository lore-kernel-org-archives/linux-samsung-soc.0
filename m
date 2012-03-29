From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: arm: mm: fix faulty calculation of area to perform cache
	operation
Date: Thu, 29 Mar 2012 13:10:01 +0100
Message-ID: <20120329121000.GE22414@n2100.arm.linux.org.uk>
References: <002c01cd0d92$14acd5f0$3e0681d0$%cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002c01cd0d92$14acd5f0$3e0681d0$%cho@samsung.com>
Sender: linux-arch-owner@vger.kernel.org
To: Cho KyongHo <pullip.cho@samsung.com>
Cc: linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, 'Younglak Kim' <younglak1004.kim@samsung.com>, 'Sanghyun Lee' <sanghyun75.lee@samsung.com>, wooki.min@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Mar 29, 2012 at 06:55:32PM +0900, Cho KyongHo wrote:
> In dma_cache_maint_page(), if offset is larger than PAGE_SIZE,
> len becomes PAGE_SIZE - offset. If size is smaller than
> PAGE_SIZE - offset, next calcuation of left cause overflow.

It is invalid for offset to be larger than PAGE_SIZE here.
