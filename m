From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 11/19] clk: samsung: exynos5433: Add clocks for
 CMU_BUS{0|1|2} domains
Date: Thu, 27 Nov 2014 13:12:08 +0100
Message-ID: <54771518.1010004@samsung.com>
References: <1417073716-22997-1-git-send-email-cw00.choi@samsung.com>
 <1417073716-22997-12-git-send-email-cw00.choi@samsung.com>
 <6217579.xNXtO7YiDs@wuerfel> <54771173.6090408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <54771173.6090408-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 27/11/14 12:56, Chanwoo Choi wrote:
> On 11/27/2014 08:41 PM, Arnd Bergmann wrote:
>> > On Thursday 27 November 2014 16:35:08 Chanwoo Choi wrote:
>>> >> +  - "samsung,exynos5433-cmu-bus0", "samsung,exynos5433-cmu-bus1"
>>> >> +    and "samsung,exynos5433-cmu-bus2" - clock controller compatible for CMU_BUS
>>> >> +    which generates global data buses clock and global peripheral buses clock.
>>> >>  
>>> >>  - reg: physical base address of the controller and length of memory mapped
>>> >>    region.
>>> >>
>> > 
>> > This looks like you are duplicating the bindings and the code, but
>> > it's really the same hardware multiple times with minor variations
>> > that you should be able to describe properly here. Why not make
>> > three nodes with the same compatible string and have them handled
>> > by the same code?
>
> Each CMU_BUSx domain of Exynos5433 have different base address as following:
> - CMU_BUS0's base address and range : 0x1360_0000 ~ 0x1360_0b04
> - CMU_BUS1's base address and range : 0x1480_0000 ~ 0x1480_0b04
> - CMU_BUS2's base address and range : 0x1340_0000 ~ 0x1340_0b04
> 
> So, I implement CMU_BUSx domain which has each compatible string.

You can always have multiple entries in the reg property. I've done
something like this for the exynos4415 CMU_ISPx units:

	cmu_isp: clock-controller@12060000 {
		compatible = "samsung,exynos4415-cmu-isp";
		reg = <0x12060000 0xB10>, <0x12070000 0xB10>;
		#clock-cells = <1>;

		assigned-clocks = <&cmu CLK_FOUT_ISP_PLL>;
		assigned-clock-rates = <300000000>;
	};

--
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
