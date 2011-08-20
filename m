From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/4] ARM: SAMSUNG: Add support for detecting CPU at runtime
Date: Sat, 20 Aug 2011 09:07:59 +0100
Message-ID: <20110820080759.GA18827@n2100.arm.linux.org.uk>
References: <1313816759-14564-1-git-send-email-kgene.kim@samsung.com>
	<1313816759-14564-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1313816759-14564-2-git-send-email-kgene.kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Aug 20, 2011 at 02:05:56PM +0900, Kukjin Kim wrote:
> The cpu_is_[name]() can be used to distinguish cpu at runtime.

This really should be soc_is_xxx().  The CPU is stuff like ARM920, ARM926,
Cortex-A9 etc.  The SoC is the CPU plus the peripherals.

S3C6410 describes the entire SoC, not just the CPU.
