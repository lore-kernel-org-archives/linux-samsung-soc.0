From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 5/7] clk/samsung: add support for pll2550xx
Date: Mon, 9 Dec 2013 13:36:09 +0530
Message-ID: <CAK9yfHybjunOjcaBd-k2ibfEW2wNFb=Rd+ZbLBO2DAfha9mZSQ@mail.gmail.com>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
 <1386345391-23482-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386345391-23482-6-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Young-Gun Jang <yg1004.jang@samsung.com>, Arun Kumar <arun.kk@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rahul,

On 6 December 2013 21:26, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> exynos5260 use pll2520xx and it has different bitfields
> for P,M,S values as compared to pll2550xx. Support for
> pll2520xx is added here.

This is a bit confusing to me. The commit message says "Support for
pll2520xx is added". However, the patch subject and the entire code looks to
be adding support for 2550xx.


-- 
With warm regards,
Sachin
