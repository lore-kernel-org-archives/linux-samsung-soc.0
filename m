From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V6 4/8] drm/exynos: Move DP setup into commit()
Date: Wed, 30 Jul 2014 17:35:32 +0530
Message-ID: <CAEC9eQP+wRr0dqQ5kiiAsujY0e1qRa4EfnaqC-nVpufX66uKUA@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-5-git-send-email-ajaykumar.rs@samsung.com>
 <20140730105245.GG29590@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140730105245.GG29590@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 30, 2014 at 4:22 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Sat, Jul 26, 2014 at 12:52:06AM +0530, Ajay Kumar wrote:
>> This patch moves the DP training and video enable from the hotplug
>> handler into commit().
>
> I don't think I can comment on this one, but perhaps the commit message
> should describe why it's doing this rather than just parroting what the
> code does.

Actually, this patch adds the missing commit callback for dp encoder.
I will add proper commit message.

Ajay
