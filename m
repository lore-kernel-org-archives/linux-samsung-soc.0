From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: Boot failure on Origen board using latest kernel
Date: Sat, 2 Mar 2013 10:26:03 +0530
Message-ID: <CAK9yfHzAVhW7RNqiq3sM97PxTjYJe4UJG6cJaGHv9+smPWedGg@mail.gmail.com>
References: <CAK9yfHw7-LJx31poPqxn_GRfEDyfReqeYTPX7Fqwzi7vtC98UQ@mail.gmail.com>
	<CAGOxZ51EuXnncDf=N7yJ1HR3GgE29Q+oLu-UQGEU0STr1m05AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGOxZ51EuXnncDf=N7yJ1HR3GgE29Q+oLu-UQGEU0STr1m05AA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "Koul, Vinod" <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Alim,

On 2 March 2013 10:18, Alim Akhtar <alim.akhtar@gmail.com> wrote:
> Hi Sachin,
>
> Looks like exynos4 is not yet moved to the generic dma binding recently
> merged.
>
> Could you try out below:

I forgot to mention in the previous mail that the problem was in non-dt case.
With the below entries added in exynos4 dtsi file, it boots fine in DT case.

-- 
With warm regards,
Sachin
