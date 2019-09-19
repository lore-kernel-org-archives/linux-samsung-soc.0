From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 1/2] memory: samsung: exynos5422-dmc: Fix kfree() of
 devm-allocated memory and missing static
Date: Thu, 19 Sep 2019 12:32:46 +0300
Message-ID: <20190919093246.GF20699@kadam>
References: <20190919092641.4407-1-l.luba@partner.samsung.com>
 <CGME20190919092652eucas1p12dbf9ba9d60a0c89cb7de05ab61893be@eucas1p1.samsung.com>
 <20190919092641.4407-2-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190919092641.4407-2-l.luba@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, willy.mh.wolff.ml@gmail.com, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com, kgene@kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Thanks!  Looks good.

regards,
dan carpenter
