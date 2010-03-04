From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PULL] Pull request for for-rmk/samsung5
Date: Thu, 4 Mar 2010 23:16:29 +0000
Message-ID: <20100304231629.GC24864@trinity.fluff.org>
References: <20100225000919.GA28433@fluff.org.uk>
	<20100302234322.GB29715@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20100302234322.GB29715@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 02, 2010 at 11:43:22PM +0000, Russell King - ARM Linux wrote:
> On Thu, Feb 25, 2010 at 12:09:19AM +0000, Ben Dooks wrote:
> >   git://git.fluff.org/bjdooks/linux.git for-rmk/samsung5
> 
> Conflicts in arch/arm/Kconfig and arch/arm/Makefile - please check
> the resulting merge carefully.
> 
> Unfortunately, no patch available since devel-stable has multiple
> ancestors.

I've pulled the git tree, and there is one minor problem missed due to
no default support for in any of the s3c_defconfigs for cpu-freq and
the s3c6400_defconfig currently fails with missing iisv4 device.

I can build for-rmk/samsung6 from for-rmk/samsung5 with the fixes for
the audio driver and the cpu-freq in. I'm just awaiting an OK on whether
to merge the header file fix for the s3c-hsotg driver in with this.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
