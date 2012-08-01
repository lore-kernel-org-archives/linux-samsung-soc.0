From: Sangbeom Kim <sbkim73@samsung.com>
Subject: Re: [PATCH 1/2] ASOC: SAMSUNG: Add DT support for i2s
Date: Wed, 01 Aug 2012 17:29:37 +0900
Message-ID: <08da01cd6fbf$cd9b5c00$68d21400$@com>
References: <1343218170-30483-1-git-send-email-padma.v@samsung.com>
 <1343218170-30483-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <1343218170-30483-2-git-send-email-padma.v@samsung.com>
Content-language: ko
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, rcsekar@samsung.com, sangsu4u.park@samsung.com, joshi@samsung.com, thutt@chromium.org, ben-linux@fluff.org, olofj@google.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,
On Wednesday, July 25, 2012 9:09 PM, Padmavathi Venna wrote:

> Add support for device based discovery.
> 
Currently, I'm reviewing your patch set.
Your patch can support device tree for Samsung's i2s.
But I wonder that Your patch can support non-dt too,
So, Please test your patch on non-dt environment.
It looks unclear handling of clock source.
After code review, I will give you more detail comments,

Thanks,
Sangbeom.
