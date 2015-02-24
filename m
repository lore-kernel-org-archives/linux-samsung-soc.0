From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/8] arm64: dts: exynos: Add dts files for 64-bit Exynos5433 SoC
Date: Tue, 24 Feb 2015 10:48:57 +0100
Message-ID: <7412525.l6YnQcTxtg@wuerfel>
References: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com> <7139111.LGA4lhSjob@wuerfel> <54EC3BB1.1020701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54EC3BB1.1020701@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: kgene@kernel.org, mark.rutland@arm.com, marc.zyngier@arm.com, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 24 February 2015 17:52:01 Chanwoo Choi wrote:
> 
> But, I have a question.
> If we put the aliases into the board dts file instaed of SoC dtsi,
> each board dts file may use the different alias name about same phandle.

Yes, that is the idea. In particular with the uarts, the intention is
that the numbering of the device nodes in /dev is the same that is
printed on the board (if any), which may be different from the numbering
internal to the SoC.

	Arnd 
