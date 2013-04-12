From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5 01/14] ARM: SAMSUNG: Move samsung-time to
 drivers/clocksource
Date: Fri, 12 Apr 2013 22:44:03 +0200
Message-ID: <201304122244.03964.arnd@arndb.de>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
 <1365794250-14436-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365794250-14436-2-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, buserror-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, augulis.darius-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christer-rKHMIqA5R6gwFerOooGFRg@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, kwangwoo.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ghcstop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, jekhor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 12 April 2013, Tomasz Figa wrote:
> ---
>  arch/arm/plat-samsung/Kconfig        |   8 -
>  arch/arm/plat-samsung/Makefile       |   1 -
>  arch/arm/plat-samsung/samsung-time.c | 394 -----------------------------------
>  drivers/clocksource/Kconfig          |   7 +
>  drivers/clocksource/Makefile         |   1 +
>  drivers/clocksource/samsung_pwm.c    | 394 +++++++++++++++++++++++++++++++++++

In general, please send patches generated with 'git format-patch -M'. You can
set that as a default using 'git config diff.renames true'.

	Arnd
