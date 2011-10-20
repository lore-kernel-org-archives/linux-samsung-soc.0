From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung cleanup-3 for v3.2
Date: Thu, 20 Oct 2011 18:24:44 +0200
Message-ID: <201110201824.44337.arnd@arndb.de>
References: <000401cc8c87$2ab684e0$80238ea0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <000401cc8c87$2ab684e0$80238ea0$%kim@samsung.com>
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
Cc: 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Monday 17 October 2011, Kukjin Kim wrote:
> This is a 3rd cleanup request for v3.2 Samsung stuff which includes cleanup
> resources and platform devices into one plat-samsung directory. As I said
> during review in mailing list, this is needed to reduce plat- directories
> and help to keep easily platform devices.
> 
> Please pull from:
>  git://github.com/kgene/linux-samsung.git next-samsung-cleanup-3
> 
> Since this moves a lot of files, I think you can pull this into your
> next/cleanup2 which will be merged late during upcoming merge window.

Yes, makes sense. As you suggested, I've pulled into next/cleanup2.
The code size reduction looks very nice.

Thanks and sorry for the delay.

	Arnd
