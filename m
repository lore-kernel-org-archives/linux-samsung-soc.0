From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 2/8] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Tue, 24 Feb 2015 20:04:17 +0900
Message-ID: <54EC5AB1.5090802@samsung.com>
References: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com>
 <7139111.LGA4lhSjob@wuerfel> <54EC3BB1.1020701@samsung.com>
 <7412525.l6YnQcTxtg@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <7412525.l6YnQcTxtg@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/24/2015 06:48 PM, Arnd Bergmann wrote:
> On Tuesday 24 February 2015 17:52:01 Chanwoo Choi wrote:
>>
>> But, I have a question.
>> If we put the aliases into the board dts file instaed of SoC dtsi,
>> each board dts file may use the different alias name about same phandle.
> 
> Yes, that is the idea. In particular with the uarts, the intention is
> that the numbering of the device nodes in /dev is the same that is
> printed on the board (if any), which may be different from the numbering
> internal to the SoC.

I check the uart device with Exynos5433 SoC based on Linux 4.0-rc1
If some board use the serial_0 and serial_3 as following in board dtsi,

	&serial_0 {		--> UART 0 device
		status = "okay";
	};

	&serial_3 {		--> UART 3 device
		status = "okay";
	};

The serial core driver create the follwoing /dev/ttySACx device node
by using the number of alias. It maintain the same device number of internel to the SoC.

	root@localhost:~# ls /dev/ttySAC
	ttySAC1  ttySAC3  

Thanks,
Chanwoo Choi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
