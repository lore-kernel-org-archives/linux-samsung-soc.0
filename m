From: Viresh Kumar <viresh.kumar@st.com>
Subject: Re: [PATCH V2 1/1] dmaengine/amba-pl08x: Add support for s3c64xx
 DMAC
Date: Wed, 28 Sep 2011 15:24:41 +0530
Message-ID: <4E82EEE1.3020706@st.com>
References: <1317189007-23033-1-git-send-email-alim.akhtar@samsung.com> <1317189007-23033-2-git-send-email-alim.akhtar@samsung.com> <4E82D0A1.8050203@st.com> <CAGOxZ53qZy+VUM65oK68W088QR=RgQ=cNxOCbO7_WESJesJaVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGOxZ53qZy+VUM65oK68W088QR=RgQ=cNxOCbO7_WESJesJaVQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 9/28/2011 2:20 PM, Alim Akhtar wrote:
> The main difference between Primecell PL080 and samsung variant is in
> LLI control register bit [0:11] is reserved in case of samsung pl080
> and one extra register is add to hold the transfer size at offset
> 0x10. The purpose of cctl1 is store the transfer_size.

So, actually you need to modify pl08x_fill_lli_for_desc() and
pl08x_cctl_bits() routines.

Updating cctl1 on the last lli will not solve your purpose,
and transfers needing more than one lli will fail.
BTW, did you try testing your patch for more than one LLI.

-- 
viresh
