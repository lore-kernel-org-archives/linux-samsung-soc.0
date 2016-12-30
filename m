From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos5433: Add bus dt node using
 VDD_INT for Exynos5433
Date: Fri, 30 Dec 2016 09:59:17 +0900
Message-ID: <5865B165.3010203@samsung.com>
References: <1481173091-9728-1-git-send-email-cw00.choi@samsung.com>
 <1481173091-9728-5-git-send-email-cw00.choi@samsung.com>
 <CGME20161208175257epcas2p333f794a00f433dd8312a5faa088a5f34@epcas2p3.samsung.com>
 <20161208175243.GA9451@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20161208175243.GA9451@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 2016년 12월 09일 02:52, Krzysztof Kozlowski wrote:
> On Thu, Dec 08, 2016 at 01:58:10PM +0900, Chanwoo Choi wrote:
>> This patch adds the bus nodes using VDD_INT for Exynos5433 SoC.
>> Exynos5433 has the following AMBA AXI buses to translate data
>> between DRAM and sub-blocks.
>>
>> Following list specify the detailed correlation between sub-block and clock:
>> - CLK_ACLK_G2D_{400|266}  : Bus clock for G2D (2D graphic engine)
>> - CLK_ACLK_MSCL_400       : Bus clock for MSCL (Memory to memory Scaler)
>> - CLK_ACLK_GSCL_333       : Bus clock for GSCL (General Scaler)
>> - CLK_SCLK_JPEG_MSCL      : Bus clock for JPEG
>> - CLK_ACLK_MFC_400        : Bus clock for MFC (Multi Format Codec)
>> - CLK_ACLK_HEVC_400       : Bus clock for HEVC (High Efficient Video Codec)
>> - CLK_ACLK_BUS0_400       : NoC(Network On Chip)'s bus clock for PERIC/PERIS/FSYS/MSCL
>> - CLK_ACLK_BUS1_400       : NoC's bus clock for MFC/HEVC/G3D
>> - CLK_ACLK_BUS2_400       : NoC's bus clock for GSCL/DISP/G2D/CAM0/CAM1/ISP
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi | 197 +++++++++++++++++++++++++
>>  arch/arm64/boot/dts/exynos/exynos5433.dtsi     |   1 +
>>  2 files changed, 198 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
> 
> For the reference:
> Reviewed-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> I'll queue it for v4.11, after this merge window.

Could you please pick this patch3/4/5?
These patches were already reviewed by you.

-- 
Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
