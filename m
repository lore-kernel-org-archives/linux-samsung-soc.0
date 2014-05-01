From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 00/16] exynos5420: clock file cleanup
Date: Thu, 01 May 2014 23:28:42 +0200
Message-ID: <5362BC8A.6020609@gmail.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: shaik.samsung@gmail.com, kgene.kim@samsung.com, mturquette@linaro.org, joshi@samsung.com, r.sh.open@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 24.04.2014 15:03, Shaik Ameer Basha wrote:
> Many changes/fixes have been identified for clock file for exynos5420.
> These include correct parents, bit fields, new clocks etc. Existing
> files needs some correction in terms of names of the clock and
> indentation. These issues are addressed in this patch series. It also
> replaces the usage of enums with macro as clock ids.
>
> This patch series is rebased on,
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git:master
>
> This patch is also dependent on the following patch.
> ARM: dts: add dt node for sss module for exynos5250/5420

Also a general comment to all the patches. Please assign clock IDs for 
all the clocks being added. In general, all the defined clocks should 
have clock IDs defined to let them be accessed from Device Tree, for 
example in case of DT clock initialization that is being worked on right 
now.

Best regards,
Tomasz
