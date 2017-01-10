From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] usb: dwc3-exynos fix unspecified suspend clk error
 handling
Date: Tue, 10 Jan 2017 20:25:52 +0200
Message-ID: <20170110182552.coom4p6dpdqo2ljv@kozik-lap>
References: <20170110022131.31042-1-shuahkh@osg.samsung.com>
 <8784459.rxWqZlDLVg@amdc3058>
 <28815306-e220-4847-99ce-b058baae0d07@osg.samsung.com>
 <CGME20170110170942epcas1p3decee28366d7d42b70e7b0669b97326f@epcas1p3.samsung.com>
 <5156028.4V9iLD3Qkj@amdc3058>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5156028.4V9iLD3Qkj@amdc3058>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: balbi@kernel.org, linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, krzk@kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, kgene@kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 10, 2017 at 06:09:40PM +0100, Bartlomiej Zolnierkiewicz wrote:
> BTW What is interesting is that the Exynos7 dts patch [2] has never
> made it into upstream for some reason.  In the meantime however
> Exynos5433 (similar to Exynos7 to some degree) became the user of
> susp_clk.
> 
> [1] https://lkml.org/lkml/2014/11/21/247
> [2] https://patchwork.kernel.org/patch/5355161/
>

+Cc Alim and Pankaj,

Anyone would like to resend [2] after rebasing and testing? Interrupt
flags would have to be fixed and status=disabled added.

Best regards,
Krzysztof
