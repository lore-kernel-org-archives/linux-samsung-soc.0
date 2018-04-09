From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 07/16] media: exymos4-is: allow compile test for EXYNOS
 FIMC-LITE
Date: Mon, 09 Apr 2018 11:49:41 +0200
Message-ID: <132c72ed-1211-682a-1926-79b10eae42c1@samsung.com>
References: <cover.1522949748.git.mchehab@s-opensource.com>
 <3cf43e723f17b55d99d817efa535ded43561b1f6.1522949748.git.mchehab@s-opensource.com>
 <CGME20180409094946epcas1p1db108f4fcd018081c90787478004d907@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <3cf43e723f17b55d99d817efa535ded43561b1f6.1522949748.git.mchehab@s-opensource.com>
Content-language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 04/05/2018 07:54 PM, Mauro Carvalho Chehab wrote:
> There's nothing that prevents building this driver with
> COMPILE_TEST. So, enable it.
> 
> While here, make the Kconfig dependency cleaner by removing
> the unneeded if block.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

With s/exymos4-is/exynos4-is in the subject

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Regards,
Sylwester
